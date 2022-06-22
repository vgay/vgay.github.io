\version "2.22.1"
#(set-global-staff-size 18)
\include "double-mark.ly"
\include "AdditionalFunctions.ly"
\include "VariablesJazz.ly"
\include "jazzchords.ily"
\include "lilyjazz.ily"
\include "chord-grid-JAS.ly"



\paper {
  indent = 0\mm
  ragged-last-bottom = ##t
  ragged-bottom = ##f
  ragged-last = ##f
  markup-system-spacing = #'((basic-distance . 23)
                             (minimum-distance . 8)
                             (padding . 1))
  score-system-spacing = #'((basic-distance . 23)
                            (minimum-distance . 20)
                            (padding . 5))
  system-system-spacing = #'((basic-distance . 15)
                             (minimum-distance . 8)
                             (padding . 0))
  oddHeaderMarkup = \markup {
    \on-the-fly \print-page-number-check-first {
      \fill-line { \null \concat { \fromproperty #'page:page-number-string "/" \page-ref #'theLastPage "0" "?"} }
  } }
  evenHeaderMarkup = \markup {
    \on-the-fly \print-page-number-check-first {
      \fill-line { \concat { \fromproperty #'page:page-number-string "/" \page-ref #'theLastPage "0" "?"} \null }
    }
  }
}

title = #"The Hardbop Grandpop"
composer = #"Horace Silver"
meter = #"(Med. Up Hardbop)"
kwtempo = #"Med. Up"
kwstyle = #"Hardbop"

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
  asplayed = #"Horace Silver" % doit être commentée si vide
  url = #"https://www.youtube.com/watch?v=0Z07vRilSjs"
  arranger = \markup \on-the-fly #played?
  \with-url #url
  \with-color #blue \underline
  \concat { "(as played by " \fromproperty #'header:asplayed ")" }
  tagline = ##f
}

\layout {
  \context {
    \Score
    \override Glissando #'style = #'zigzag
    \override Glissando.breakable = ##t
    \override Glissando.after-line-breaking = ##t
    startRepeatType = #"[|:"
    endRepeatType = #":|]"
    doubleRepeatType = #":|][|:"
    \override Clef #'break-visibility = #'#(#f #f #f)
    \override KeySignature #'break-visibility = #'#(#f #f #f)
    \override SystemStartBar #'collapse-height = #1
    \override ParenthesesItem.font-size = #2
    \override MultiMeasureRest #'expand-limit = #3
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
  \context { \Score markFormatter = #format-mark-box-alphabet }
}


form = \markup  \fill-line {
  \column {  }
  \column { \line { \with-color #red \fontsize #2 "Solos on AABBA then D.S. al Fine" } }
}

harmonies = \chordmode {
  \set chordChanges = ##f
  s8 s2 as2:6 g:13 ges:7 f:7 f1:m bes:13 bes:m7 es:9 as:6 es2:m7 as:7 des1:7+
  des2:m7 ges:7 as:13 c:13 f:m as f1:m7 bes:13 bes:m7 es:9
  as2:6 g:13 ges:7 f:7 f1:m bes:7 g:m5-7 c:9- f:m6 g2:m5-7 c:9- f1:m6 g2:m5-7 c:9- f1:m7 b:dim7
  c2:m7 f:7 bes:m7 es:7 as f:9-13 bes:9+ es4.:9-13 as8
  as2 f:9-13 bes:9+ es4.:9-13 as8 s2 f:9-13 bes:9+ es4.:9-13 as8:6.9
}


theNotes =  \relative c'' {
  \clef "treble" \key as \major \time 4/4
  \partial 8*5 as8 es f as f' | \bar "||"
  es4 as, c r | r8 b c es c as f es | as4 4 f r | R1 \break
  r8 b c es c as f es | as4 as2 f8 es | r4 as, c r | R1 | \break
  r8 as'4. f8 as f4 | as as e r | r8 as4. es8 as es4 | as as es r | \break
  r r8 f e f as c | f4 4 c r  |  r8 b c es des f, as c | r4 r8 as es f as f' | \break \bar "||"
  es4 as, c r | r8 b c es c as f es | as4 4 f r | r2 r4 r8 a | \break
  bes a bes c des c bes as | g f e g bes des c bes | as f r4 r2 | R1 \break
  r8 <as, c> <c f>4 <f as> <as c> | <des, e> <e g> <g bes>8 <bes des> r4
  r8 <as, c> <c f>4 <es as>8 <c' f> r <f as>~ | q2.~ q8 c \break
  r es, r4 r es8 e | f as bes f as bes r as~  |
  8 r r4 <d, ges>4 q | <des f> q <c e>8 q4 <bes es>8-^
  \break \bar "||" \doubleMark
  \markup  { \with-color #red { "To Coda" \raise #1 \musicglyph "scripts.varcoda" } }
  \markup  { \with-color #red { \musicglyph "scripts.varcoda" } }
  r2 <d ges>4 q | <des f> q <c e>8 q4 <bes es>8-^ |
  r2 <d ges>4 q | <des f> q <c e>8 q4 <f bes>8~ | q1 \fermata
  % \showStartRepeatBar \bar "[|:"

  \bar ".."
  \label #'theLastPage
}

chordsRhythm = \relative c' {
  \override Rest #'staff-position = #7
  \improvisationOn \override NoteHead.no-ledgers = ##t
  % \partial 8
  % \showStartRepeatBar \bar "[|:"


}

Basse = \relative c' {
  \clef "bass" \key f \major \time 4/4
  % \partial 8
  % \showStartRepeatBar \bar "[|:"

  \bar ".."
}

grille = \chordmode {
  \bar "[|:"
  as2:6 g:13 ges:7 f:7 f1:m bes:13 \break
  bes:m7 es:9 as:6 es2:m7 as:7 \break
  des1:7+ des2:m7 ges:7 as:13 c:13 f:m as \break
  f1:m7 bes:13 bes:m7 es:9 \break \bar "||"
  as2:6 g:13 ges:7 f:7 f1:m bes:7 \break
  g:m5-7 c:9- f:m6 g2:m5-7 c:9- \break
  f1:m6 g2:m5-7 c:9- f1:m7 b:dim7 \break
  c2:m7 f:7 bes:m7 es:7 as f:9-13 bes:9+ es:9-13 \break
  \mark \markup \column  { \pad-around #1 " " \with-color #red { \musicglyph "scripts.varcoda" } }
  \bar ":|][|:" as2 f:9-13 bes:9+ es:9-13 \bar ":|]" as1:6.9 \bar ".." \stopStaff s1 \bar "" }

grilleRhythm = {
  \improvisationOn
  %\repeat unfold 7 { \hideNotes c1*4 \unHideNotes }
  s1*30 s2
  c4 4 | 4 4 8 4 8~ 2 4 4 | 4 4 8 4 8~ 1 \fermata
}

\book {
  \paper {
    #(set-paper-size "a5landscape")
    %page-count = #1
    print-first-page-number = ##t
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
    } %\form
} }

\book {
  \paper {
    #(set-paper-size "a5landscape")
    %page-count = #1
    print-first-page-number = ##t
  }
  #(define output-suffix "BbTab")
  %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies }
        \new Staff \with { instrumentName = \Bb } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }
          \transpose c d \theNotes
        >>
      >>
    } %\form
} }

\book {
  \paper {
    #(set-paper-size "a5landscape")
    %page-count = #1
    print-first-page-number = ##t
  }
  #(define output-suffix "EbTab")
  %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with { instrumentName = \Eb } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }
          \transpose c a \theNotes
        >>
      >>
    } %\form
} }

\book {
  \paper {
    #(set-paper-size "a4")
    print-page-number = ##f
  }
  #(define output-suffix "Ca4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \CleSol }
        <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }
          \theNotes
        >>
      >>
    } %\form
  }  \bookpart {
    \score {
      \gridLayout
      <<      \new RhythmicStaff
              \with { \override StaffSymbol.line-count = 0
                      \remove Time_signature_engraver
                      \remove Bar_engraver
                      \RemoveEmptyStaves
              }
              \grilleRhythm
              \new ChordGrid \grille
      >>
  } } }

  \book {
    \paper {
      #(set-paper-size "a4")
      print-page-number = ##f
    }
    #(define output-suffix "Bba4")
    \bookpart {
      \score {
        <<
          \new ChordNames { \transpose c d \harmonies }
          \new Staff \with { instrumentName = \Bb  } <<
            % \new Voice \with { \consists "Pitch_squash_engraver" }
            \transpose c d \theNotes
          >>
        >>
      } %\form
    }  \bookpart {
      \score {
        \gridLayout
        \new ChordGrid \transpose c d \grille
  } } }

  \book {
    \paper {
      #(set-paper-size "a4")
      print-page-number = ##f
    }
    #(define output-suffix "Eba4")
    \bookpart {
      \score {
        <<
          \new ChordNames { \transpose c a \harmonies }
          \new Staff \with { instrumentName = \Eb } <<
            %\new Voice
            \transpose c a \theNotes
          >>
        >>
      } %\form
    }  \bookpart {
      \score {
        \gridLayout
        \new ChordGrid \transpose c a \grille
  } } }

