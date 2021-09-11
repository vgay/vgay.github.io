
\version "2.19.80"
#(set-global-staff-size 18)
\include "AdditionalFunctions.ly"
\include "VariablesJazz.ly"
\include "jazzchords.ily"
\include "lilyjazz.ily"



\paper {
  indent = 0\mm
  ragged-last-bottom = ##t
  ragged-bottom = ##f
  ragged-last = ##f
  markup-system-spacing = #'((basic-distance . 23)
                             (minimum-distance . 8)
                             (padding . 1))
  score-system-spacing = #'((basic-distance . 15)
                            (minimum-distance . 12)
                            (padding . 3))
}

title = #"All The Things You Are"
composer = #"Jerome Kern"
meter = #"(Med. Swing)"
kwtempo = #"Medium"
kwstyle = #"Swing"

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
  % asplayed = #"" % doit être commentée si vide
  url = #""
  arranger = \markup \on-the-fly #played?
  \with-url #url
  \with-color #blue \underline
  \concat { "(as played by " \fromproperty #'header:asplayed ")" }
  tagline = ##f
}

\layout {
  \context {
    \Score
    voltaSpannerDuration = #(ly:make-moment 4 4)
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

hintro = \chordmode {
  \set chordChanges = ##t
  s2 des1*2:9+ c:9+ s8 s2 }

harmonies = \chordmode {
  \set chordChanges = ##t 
  f1:m7 bes:m7 es:7 aes:7+ des:7+ g:7 c1:7+ c:7+
  c:m7 f:m7 bes:7 es:7+ aes:7+ a2:m5-7 d:7 g1.:7+ e2:9+
  a1:m7 d:7 g:7+ g:7+ fis:m5-7 b:7 e:7+ c:5+7
  f1:m7 bes:m7 es:7 aes:7+ des:7+ ges:13 
  c1:m7 b:dim bes:m7 es:7 aes:7+ \startParenthesis \parenthesize g2:m5-7 \endParenthesis \parenthesize  c:9-
}

intro =  \relative c'' {
  \key as \major \time 4/4 
  \partial 8 a8
  \Intro
  \repeat "volta" 2 
  { aes!8 des,4. ~ des a'8 | aes! des,4 a'8 aes des,4 a'8 
    aes! c,4. ~ c a'8 }
  \alternative { 
    { aes! c,4 a'8 aes c,4 a'8 }
    { aes! c,4 a'8 aes c,4. } }
}


theNotes =  \relative c'' {
  \clef "treble" \key as \major \time 4/4 
  \Head
  aes1 | des2. aes4 | g4 g g g | g c2 g4 
  f f f f | f b2 f4 | e1~ | e \bar "||" \break
  es? | aes2. es4 | d d d d | d g2 d4  
  c c c c | c d8 es d4 c | b1 ~ | b4 d g d' \bar "||" \break
  d4. c8 c2~ | c4 es, e c' | b1 ~ | b4 d, g b 
  b4. a8 a2 ~ | a4 bes, b a' | aes?1 ~ | aes \bar "||" \break
  aes1 | des2. aes4 | g4 g g g | g c2 g4 
  f1 | es'2. des4 |  
  es, es \tuplet 3/2 { es es es } | g2. f4  des f aes des | 
  \override TextSpanner.bound-details.left.text = "solo break"
  \textSpannerDown
  f2 g, | aes4 \startTextSpan r2. | R1 \stopTextSpan \bar "|." \break
}

verse = \lyricmode {
  You are the pro -- mised kiss of spring -- time,
  That makes the lone -- ly win -- ter seem long __ \skip 1
  You are the breath -- less hush of eve -- ning,
  That trem -- bles on the brink of a love -- ly song __ \skip 1
 You are the an -- gel glow  __ \skip 1 that lights a star, __ \skip 1
  The dea -- rest things I know __ \skip 1  are what you are. __ \skip 1 
  Some day my hap -- py arms will hold you,
  And some day I'll know that mo -- ment di -- vine.
  When all the things you are, are mine!.

}

chordsRhythm = \relative c''' {
  \override Rest #'staff-position = #8
  \improvisationOn \override NoteHead.no-ledgers = ##t 
  s8 r8 r4 d8~ 2~ | 2 r | r8 r4 d8~ 2~ | 2 r | 2 \repeatTie r
}

Basse = \relative c {
  \override Rest #'staff-position = #0
  \clef "bass" \key f \major \time 4/4
}

grille = \chordmode {
  f1:m7 bes:m7 es:7 as:7+ \break
  des:7 g:7 \repeat percent 2 c:7+ \break \bar "||"
  c:m7 f:m7 bes:7 es:7+ \break
  as:7+ \/a2:m5-7 d:7 g1:7+ \/g2:7+ e:9+ \break \bar "||"
  a1:m7 d:7 \repeat percent 2 g:7+ \break
  fis:m5-7 b:7 e:7+ c:5+7 \break \bar "||"
  f1:m7 bes:m7 es:7 as:7+ \break
  des:7 g:13 c:m7 b:dim \break
  bes:m7 es:7 as:7+ \/g2:m5-7 c:9-
  \bar ".." }

marques = \relative c' { 

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
        \new ChordNames { \hintro }
        \new Staff  <<
          \clef "bass" \transpose c c,, \chordsRhythm \\ \transpose c c,, \intro
        >> 
      >>
    } 
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
    #(set-paper-size "tablette")
    page-count = #1
  }
  #(define output-suffix "BbTab") 
  %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c d \hintro }
        \new Staff  <<
          \chordsRhythm \\  \transpose c d \intro
        >> 
      >>
    } 
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies } 
        \new Staff \with { instrumentName = \Bb } <<
          \transpose c d \theNotes
        >> 
      >>
    } %\form
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
        \new ChordNames { \transpose c a \hintro }
        \new Staff  <<
          \chordsRhythm \\ \transpose c a \intro
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
    } %\form
} }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #1
  }
  #(define output-suffix "Ca4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \hintro }
        \new Staff  <<
          \clef "bass" \transpose c c,, \chordsRhythm \\ \transpose c c,, \intro
        >> 
      >>
    } 
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \CleSol } 
        <<
          %\new Voice \with { \consists "Pitch_squash_engraver" } 
          \theNotes \\ { \repeat unfold 8 { s1*4 \break } }
        >> 
        \addlyrics \verse
      >>
    } %\form
  }  \bookpart {
    \score {
      \layout {
        indent = 0
        ragged-right = ##f
        ragged-last = ##f
        \context {
          \Score
          \remove "Volta_engraver"
          \omit Clef % Cacher la clef
          \omit TimeSignature % cacher la métrique
          \omit BarNumber             
          \override SpacingSpanner.strict-note-spacing = ##t
          proportionalNotationDuration = #(ly:make-moment 1/16)
        }
      }
      <<
        \new Staff \with {
          \remove "Staff_symbol_engraver"
        }    
        \marques
        \new ChordNames \with {
          \override ChordName.extra-offset = #'(10 . -1 )         
          \override ParenthesesItem.extra-offset = #'(10 . -1 ) 
          \override BarLine.bar-extent = #'(-5 . 5)
          \consists "Bar_engraver"
          \override StaffSymbol.line-positions = #'( -10 10 ) 
          \consists "Staff_symbol_engraver"
          \consists "Percent_repeat_engraver"
          \consists "Volta_engraver"
        }
        \grille
      >>
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #1
  }
  #(define output-suffix "Bba4") 
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c d \hintro }
        \new Staff  <<
          \chordsRhythm \\ \transpose c d \intro
        >> 
      >>
    }    \score {
      <<
        \new ChordNames { \transpose c d \harmonies } 
        \new Staff \with { instrumentName = \Bb  } <<
          \transpose c d \theNotes \\ { \repeat unfold 8 { s1*4 \break } }
        >> 
        \addlyrics \verse
      >>
    } %\form
  }  \bookpart {
    \score {
      \layout {
        indent = 0
        ragged-right = ##f
        ragged-last = ##f
        \context {
          \Score
          \remove "Volta_engraver"
          \omit Clef % Cacher la clef
          \omit TimeSignature % cacher la métrique
          \omit BarNumber             
          \override SpacingSpanner.strict-note-spacing = ##t
          proportionalNotationDuration = #(ly:make-moment 1/16)
        }
      }
      <<
        \new Staff \with {
          \remove "Staff_symbol_engraver"
        }    
        \marques
        \new ChordNames \with {
          \override ChordName.extra-offset = #'(10 . -1 )         
          \override ParenthesesItem.extra-offset = #'(10 . -1 ) 
          \override BarLine.bar-extent = #'(-5 . 5)
          \consists "Bar_engraver"
          \override StaffSymbol.line-positions = #'( -10 10 ) 
          \consists "Staff_symbol_engraver"
          \consists "Percent_repeat_engraver"
          \consists "Volta_engraver"
        }
        \transpose c d \grille
      >>
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #1
  }
  #(define output-suffix "Eba4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c a \hintro }
        \new Staff  <<
          \chordsRhythm \\ \transpose c a \intro
        >> 
      >>
    }     \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with { instrumentName = \Eb } <<
          \transpose c a \theNotes \\ { \repeat unfold 8 { s1*4 \break } }
        >> 
        \addlyrics \verse
      >>
    } %\form
  }  \bookpart {
    \score {
      \layout {
        indent = 0
        ragged-right = ##f
        ragged-last = ##f
        \context {
          \Score
          \remove "Volta_engraver"
          \omit Clef % Cacher la clef
          \omit TimeSignature % cacher la métrique
          \omit BarNumber             
          \override SpacingSpanner.strict-note-spacing = ##t
          proportionalNotationDuration = #(ly:make-moment 1/16)
        }
      }
      <<
        \new Staff \with {
          \remove "Staff_symbol_engraver"
        }    
        \marques
        \new ChordNames \with {
          \override ChordName.extra-offset = #'(10 . -1 )         
          \override ParenthesesItem.extra-offset = #'(10 . -1 ) 
          \override BarLine.bar-extent = #'(-5 . 5)
          \consists "Bar_engraver"
          \override StaffSymbol.line-positions = #'( -10 10 ) 
          \consists "Staff_symbol_engraver"
          \consists "Percent_repeat_engraver"
          \consists "Volta_engraver"
        }
        \transpose c a \grille
      >>
} } }