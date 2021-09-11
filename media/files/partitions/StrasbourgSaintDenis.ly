
\version "2.19.80"
#(set-global-staff-size 18)
\include "AdditionalFunctions.ly"
\include "VariablesJazz.ly"
\include "jazzchords.ily"
\include "lilyjazz.ily"



\paper {
  indent = 0\mm
  between-system-space = 2.5\cm
  between-system-padding = #0
  %%set to ##t if your score is less than one page:
  ragged-last-bottom = ##t
  ragged-bottom = ##f
  ragged-last = ##f
  markup-system-spacing = #'((basic-distance . 23)
                             (minimum-distance . 8)
                             (padding . 3))
}

title = #"Strasbourg - Saint Denis"
composer = #"Roy Hardgrove"
meter = #"(Med. Funk)"
kwtempo = #"Medium"
kwstyle = #"Funk"

realBookTitle = \markup {
  \score {
    {
      \override TextScript.extra-offset = #'(0 . -4.5)
      s4
      s^\markup {
        \fill-line {
          \fontsize #1 \lower #1 \rotate #7 \concat { " " #meter }
          \fontsize #4
          \override #'(offset . 9)
          \override #'(thickness . 6)
          \underline \larger \larger #title
          \fontsize #1 \lower #1 \concat { #composer " " }
        }
      }
      s
    }
    \layout {
      \omit Staff.Clef
      \omit Staff.TimeSignature
      \omit Staff.KeySignature
      ragged-right = ##f
    }
  }
}

\header {
  pdftitle = #title
  pdfauthor = #composer
  pdfkeywords = \markup \concat { #kwtempo " " #kwstyle }
  title = \realBookTitle
  asplayed = #"Roy Hargrove" % doit être commentée si vide
  url = #"https://www.youtube.com/watch?v=W3y0jCIP5wc"
  arranger = \markup \on-the-fly #played?
  \with-url #url
  \with-color #blue \underline
  \concat { "(as played by " \fromproperty #'header:asplayed ")" }
  tagline = ##f
}

\layout {
  \context {
    \Score
    startRepeatType = #"[|:"
    endRepeatType = #":|]"
    doubleRepeatType = #":|][|:"
    \override Clef #'break-visibility = #'#(#f #f #f)
    \override KeySignature #'break-visibility = #'#(#f #f #f)
    \override SystemStartBar #'collapse-height = #1
    \override ParenthesesItem.font-size = #2
  }
  \context { 
    \Staff
    printPartCombineTexts = ##f
    \consists "Merge_rests_engraver"
  }
  \context {
    \ChordNames
    \override ParenthesesItem.font-size = #2
  }
  %   \context { \RemoveEmptyStaffContext 				% ne pas imprimer les lignes vides (autres que la première)
  %              \override VerticalAxisGroup #'remove-first = ##t			% Concerne la première ligne
  %   }
}




form = \markup  \fill-line {
  \column {  }
  \column { \line { \with-color #red \fontsize #2 "Solos on AABBA then D.S. al Fine" } }
}

harmonies = \chordmode {
  \set chordChanges = ##t
  bes2:m7 c4.:m7 des8:7+ s2 c:m7 bes2:m7 c4.:m7 des8:7+ s2 f:9+13-
  bes2:m7 c4.:m7 des8:7+ s2 es:7sus4 as:7+ s8 g:7 as:7/ges f:9- s1
}



theNotes = \relative c''' { 
  \clef "treble" \key as \major \time 4/4
  \mark \markup \bold \box Head 
  \showStartRepeatBar \bar "[|:"
  \repeat volta 2 {
    as16 f es f c bes as bes es,8 bes' as4~ | as2 r |
    as'16 f es f c bes as bes es,8 bes' as4~ | as8 r c es r2 \break
    as16 f es f c bes as bes es,8 bes' as4~ | as4 r16 f as8 c4 bes8. as16 |
    g8. f16 es4 << {  g8 8 as a~ } \\ {  c,8 es f ges~ } >> }
  \alternative {
    { << {  a8 ges4 } \\ {  ges8 f4  } >>  f8~ f4 r }
    { << {  a8 ges4 } \\ {  ges8 f4  } >>  f8~ f4 r8  \stemUp c'16 bes }
  } \bar "||" \break
  \once \override Staff.Clef #'break-visibility = #'#(#f #f #t)
  \once \override Staff.KeySignature #'break-visibility = #'#(#f #f #t)
  << { 
    as f es des c4 r  r8 c16 des | es f as bes c4 r r8 c16 bes |
    as f es des c4 r r8 c16 des | es f as bes c4 r8 c16 bes as f es des | \break
    c8 c'16 bes as f es des c8 c'16 bes as f es des | c8 c'16 bes as f es des c4 bes'8. as16 |
    g8. f16 es4~ 8 8 f ges~ | 4.  f8~ 4 r } 
     \new Staff {  \clef "treble" \key as \major \time 4/4
                   r4 r8 c'16 bes as f es des c4 | r4 r8 c'16 bes as f es des c4 |
                   r4 r8 c'16 bes as f es des c4 | r16 c8 des16 es f as bes c4 r8 c16 bes |
                   as f es des c8 c'16 bes as f es des c8 c'16 bes | as f es des c8 c16 des es f as bes bes8. as16 |
                   g2 8 8 as a~ | a as4 f8~ 4 r } >>
  \bar "||"
}

comp = #(define-music-function (count) (integer?)
          #{
            \override Rest.stencil = #ly:percent-repeat-item-interface::beat-slash
            \override Rest.thickness = #0.48
            \repeat unfold $count { r4 }
            \revert Rest.stencil
          #}
          )

chordsRhythm = \relative c' {
  \override Rest #'staff-position = #8
  \improvisationOn \override NoteHead.no-ledgers = ##t 
  
  \comp #3  e8 8~ | 4 \comp #3 | \comp #3  8 8~ | 4 \comp #3
  \comp #3 8 8~ | 4 8 8~  4 \comp #3 r8 8 8 8~ | 4 \comp #3
}

Basse = \relative c {
  \override Rest #'staff-position = #0
  \clef "bass" \key as \major \time 4/4
  \mark \markup \bold \box Rhythm
  bes4 4 c8 4 des8~ | 2 r8 c f, c' | bes4 4 c8 4 des8~ | 4 r8 es16 e f c f,8 ~ 4 |
  bes4 4 c8 4 des8~ | 8 8 d es~ es4 g8 bes | as es as,4 8 g ges f8~ | 4. c'8 ges'4 f
}

grille = \chordmode {
}

marques = \relative c' { 
  s
}


\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #1
  }
  #(define output-suffix "CTab")
  %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \CleSol } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" } 
          \theNotes
        >> 
      >>
    } \markup "Rhythm section next page"
  } \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \CleFa } 
        <<
          \chordsRhythm  \\ \Basse
        >> 
      >>
    } 
} }

\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #1
  }
  #(define output-suffix "BbTab") 
  %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \CleSol } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" } 
          \theNotes
        >> 
      >>
    } \markup "Rhythm section next page"
  } \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \CleFa } 
        <<
          \chordsRhythm  \\ \Basse
        >> 
      >>
    } 
} }

\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #1
  }
  #(define output-suffix "EbTab")
  %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \CleSol } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" } 
          \theNotes
        >> 
      >>
    } \markup "Rhythm section next page"
  } \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \CleFa } 
        <<
          \chordsRhythm  \\ \Basse
        >> 
      >>
    } 
} }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #1
    markup-system-spacing = #'((basic-distance . 23)
                               (minimum-distance . 20)
                               (padding . 7))
    score-system-spacing = #'((basic-distance . 23)
                              (minimum-distance . 20)
                              (padding . 5))
  }
  #(define output-suffix "Ca4")
  %\header { opus = " " }
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \CleFa } 
        <<
          \chordsRhythm  \\ \Basse
        >> 
      >>
    } 
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \CleSol } 
        <<
          \theNotes
        >> 
      >>
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #1
    markup-system-spacing = #'((basic-distance . 23)
                               (minimum-distance . 20)
                               (padding . 7))
    score-system-spacing = #'((basic-distance . 23)
                              (minimum-distance . 20)
                              (padding . 5))
  }
  #(define output-suffix "Bba4") 
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \CleFa } 
        <<
          \chordsRhythm  \\ \Basse
        >> 
      >>
    } 
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies } 
        \new Staff \with { instrumentName = \Bb  } <<
          % \new Voice \with { \consists "Pitch_squash_engraver" }  
          \transpose c d \theNotes
        >> 
      >>
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #1
    markup-system-spacing = #'((basic-distance . 23)
                               (minimum-distance . 20)
                               (padding . 7))
    score-system-spacing = #'((basic-distance . 23)
                              (minimum-distance . 20)
                              (padding . 5))
  }
  #(define output-suffix "Eba4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \CleFa } 
        <<
          \chordsRhythm  \\ \Basse
        >> 
      >>
    } 
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with { instrumentName = \Eb } <<
          \transpose c a \theNotes
        >> 
      >>
} } }